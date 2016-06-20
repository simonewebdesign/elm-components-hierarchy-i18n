import Html exposing (..)
import Html.App as Html
--import Html.Attributes exposing (..)
--import Html.Events exposing (onClick)
import Form.Input.Text exposing (Text)
--import Number exposing (Number)


main : Program Never
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model =
  {
  }


type Component =
  Text Text
  --Number Number


initialModel : Model
initialModel =
  {
  }


init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)


-- UPDATE

type Msg
  = NoOp


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      (model, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ text "Hello, world!"
    , text (toString model)
    ]