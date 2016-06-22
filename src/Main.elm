import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (class)

--import Form.Input
import Form.Input.Text
import Form.Input.Number
import Form.Wrapper.Fieldset

import Translation exposing (Language(..), translate)


main : Program Never
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

--This Main module shows 3 things:
--  - A fieldset
--  - A text field
--  - A number field


type alias Model =
  { fieldset : Form.Wrapper.Fieldset.Model
  , text : Form.Input.Text.Model
  , number : Form.Input.Number.Model
  , language : Language
  }
  --{ inputs : List ( Path, Form.Input.Input )
  --, fieldsets : List ( ID, Form.Input.Fieldset )
  --}

--type alias Path =
--  List String

--type alias ID =
--  String

--type Input
--  = IText Text
--  | INumber Number


initialModel : Model
initialModel =
  { fieldset = Form.Wrapper.Fieldset.initialModel
  , text = Form.Input.Text.initialModel
  , number = Form.Input.Number.initialModel
  , language = English
  }


init : ( Model, Cmd Msg )
init =
  ( initialModel, Cmd.none )


-- UPDATE

type Msg
  = NoOp
  | FieldsetMsg Form.Wrapper.Fieldset.Msg
  | TextMsg Form.Input.Text.Msg
  | NumberMsg Form.Input.Number.Msg
  --| UpdateInput Path Input


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )

    FieldsetMsg subMsg ->
      { model | fieldset = Form.Wrapper.Fieldset.update subMsg model.fieldset } ! []

    TextMsg subMsg ->
      { model | text = Form.Input.Text.update subMsg model.text } ! []

    NumberMsg subMsg ->
      { model | number = Form.Input.Number.update subMsg model.number } ! []

    --UpdateInput path newInput ->
    --  let
    --    updateInput =
    --      \( aPath, input ) ->
    --        if aPath == path then
    --          case input of
    --            IText mdl ->
    --              ( path, IText <| Form.Input.Text.update (Form.Input.Text.Change newVal) mdl )

    --            INumber mdl ->
    --              ( path, INumber <| Form.Input.Number.update (Form.Input.Number.Change newVal) mdl )
    --        else
    --          ( aPath, input )
    --  in
    --    { model | inputs = List.map updateInput model.inputs } ! []


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEW

view : Model -> Html Msg
view ({text} as model) =
  div []
    [ Html.text "Hello, world!"
    , Html.text (toString model)
    , div
        [ class "inputs" ]
        [ Html.map FieldsetMsg (Form.Wrapper.Fieldset.view model.fieldset)
        , Html.map TextMsg (Form.Input.Text.view { text | translate = translate model.language })
        , Html.map NumberMsg (Form.Input.Number.view model.number)
        ]
    --, div
    --    [ class "buttons" ]
    --    [ button
    --        [ onClick <| UpdateInput ["someTextField"] <| IText <| Form.Input.Text.Model "someTextField" "changed!" ]
    --        [ text "Change the value of someTextField" ]
    --    ]
    ]
