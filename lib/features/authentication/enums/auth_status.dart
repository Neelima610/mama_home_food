enum AuthStatus {

  // Initial app state
  initial,


  // Checking saved login session
  checking,


  // User is logged in
  authenticated,


  // User is logged out
  unauthenticated,


  // Login/signup/OTP process running
  loading,


  // Authentication failed
  error,
}