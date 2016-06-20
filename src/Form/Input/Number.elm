module Form.Input.Number exposing (..)

import Html exposing (Html, text)


type alias Number = Model

type alias Model =
  { name : String
  , value : Int
  }

initialModel : Model
initialModel =
  { name = "defaultName"
  , value = 0
  }


type Msg =
  SetValue Int


update : Msg -> Model -> Model
update msg model =
  case msg of
    SetValue newVal ->
      { model | value = newVal }


view : Model -> Html Msg
view model =
  text <| "Text component. view model debug: " ++ (toString model) 
