module Translation exposing
  ( Language(..)
  , Key(..)
  , translate
  )

{-| Used internally to retrieve the right translation string. -}
type alias Collection =
  { english : String
  , japanese : String
  , spanish : String
  }


{-| Currently supported languages. -}
type Language
  = English
  | Japanese
  | Spanish


{-| This is the ID you can use to refer to a specific string. -}
type Key
  = Login
  | Logout
  | WelcomeBack {name : String}


{-| Usage:

    translate Spanish Login == "Por favor haga login"
    translate English (WelcomeBack {name = "John"}) == "Welcome back John"
-}
translate : Language -> Key -> String
translate lang key =
  let
    collection =
      case key of
        Login ->
          Collection
            "Please login"
            "Login in Japanese"
            "Por favor haga login"

        Logout ->
          Collection
            "Log out"
            "Logout in Japanese"
            "Haga logout"

        WelcomeBack {name} ->
          Collection
            ("Welcome back " ++ name)
            ("Welcome back in Japanese " ++ name)
            ("Bienvenido "  ++ name)
  in
    case lang of
      English -> .english collection
      Japanese -> .japanese collection
      Spanish -> .spanish collection
