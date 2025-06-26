;; Territory Analyst Verification Contract
;; Manages analyst registration and verification

;; Constants
(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_REGISTERED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_INPUT (err u103))

;; Data Variables
(define-data-var next-analyst-id uint u1)

;; Data Maps
(define-map analysts
  { analyst-id: uint }
  {
    principal: principal,
    name: (string-ascii 50),
    credentials: (string-ascii 100),
    verified: bool,
    registration-block: uint
  }
)

(define-map analyst-principals
  { principal: principal }
  { analyst-id: uint }
)

;; Public Functions

;; Register a new analyst
(define-public (register-analyst (name (string-ascii 50)) (credentials (string-ascii 100)))
  (let ((analyst-id (var-get next-analyst-id))
        (caller tx-sender))
    (asserts! (> (len name) u0) ERR_INVALID_INPUT)
    (asserts! (> (len credentials) u0) ERR_INVALID_INPUT)
    (asserts! (is-none (map-get? analyst-principals { principal: caller })) ERR_ALREADY_REGISTERED)

    (map-set analysts
      { analyst-id: analyst-id }
      {
        principal: caller,
        name: name,
        credentials: credentials,
        verified: false,
        registration-block: block-height
      }
    )

    (map-set analyst-principals
      { principal: caller }
      { analyst-id: analyst-id }
    )

    (var-set next-analyst-id (+ analyst-id u1))
    (ok analyst-id)
  )
)

;; Verify an analyst (only contract owner)
(define-public (verify-analyst (analyst-id uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? analysts { analyst-id: analyst-id })
      analyst-data
      (begin
        (map-set analysts
          { analyst-id: analyst-id }
          (merge analyst-data { verified: true })
        )
        (ok true)
      )
      ERR_NOT_FOUND
    )
  )
)

;; Read-only Functions

;; Get analyst information
(define-read-only (get-analyst (analyst-id uint))
  (map-get? analysts { analyst-id: analyst-id })
)

;; Get analyst ID by principal
(define-read-only (get-analyst-id (principal principal))
  (map-get? analyst-principals { principal: principal })
)

;; Check if analyst is verified
(define-read-only (is-verified-analyst (principal principal))
  (match (map-get? analyst-principals { principal: principal })
    analyst-info
    (match (map-get? analysts { analyst-id: (get analyst-id analyst-info) })
      analyst-data (get verified analyst-data)
      false
    )
    false
  )
)
