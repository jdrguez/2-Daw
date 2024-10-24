$(document).ready(function() {
    // Función para agregar tareas
    $("#agregar-tarea").click(function() {
        const new_task = $("#nueva-tarea").val()
        if (new_task != "") {
            $("#lista-tareas").append(`
        <li>
            <p id="name-task">${new_task}</p>
            <div style="display: flex;">
                <button class="edit-button">Edit</button>
                <button class="delete-button">Delete</button>
            </div>
        </li>
        `);

        //Eliminar elemento
        $(".delete-button").click(function() {
            $(this).parents("li").remove();
        });

        //Editar elemento
        $(".edit-button").click(function() {
            window.modal.showModal();
            
            $("#guardar").click(function(){
                console.log('click')
                const new_name = $("#editar-mision").val();
                console.log(new_name)
                if (new_name != ""){
                    $("#name-task").text(new_name);
                    window.modal.close();
            }
            })
            
        });
            
        } else {
            alert("No haz introducido ninguna tarea")
        }
    });



    // Borrar todo
    $("#limpiar-tareas").click(function() {
        $("#lista-tareas").empty()
    });
});




