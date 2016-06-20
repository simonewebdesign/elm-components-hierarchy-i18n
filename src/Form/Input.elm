module Form.Input exposing (Input(..))

import Form.Input.Text
import Form.Input.Number

type Input
  = Text Form.Input.Text.Model
  | Number Form.Input.Number.Model
