
if(!empty($_POST['check_list'])){
				 // Bucle para almacenar y mostrar los valores de la casilla de verificación comprobación individual.
				 foreach($_POST['check_list'] as $value){
					$datos = array("descripcion" => $value
				);
				$respuesta = ModeloMarcas::mdlIngresarMarca($datos);

				 }
				 }


                 <fieldset>
              <legend>Choose your monster's features:</legend>

              <div>
                <input type="checkbox" value="España" name="check_list[]">
                <label >España</label>
              </div>

              <div>
                <input type="checkbox" value="Alemania" name="check_list[]">
                <label >Alemania</label>
              </div>

              <div>
                <input type="checkbox" value="Perú" name="check_list[]">
                <label >Perú</label>
              </div>

              <div>
                <input type="checkbox" value="Argelia" name="check_list[]">
                <label >Argelia</label>
              </div>
          </fieldset>