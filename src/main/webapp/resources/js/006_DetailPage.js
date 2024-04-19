function updateOption() {
    // 선택된 옵션의 값을 가져와서 텍스트 입력란에 설정
    var selectedOption = document.getElementById("option1").value;
    document.getElementById("option").value = selectedOption;
     document.getElementById("option2").value = selectedOption;
    
    
     document.getElementById("option1").value = selectedOption;
     
}


function updateQuantity() {
    // 수량 값을 가져와서 텍스트 입력란에 설정
    var quantityValue = document.getElementById("quantityInput").value;
    document.getElementById("quantity1").value = quantityValue;
}

  function increment() {
    var quantityInput = document.getElementById("quantityInput");
    var quantity = parseInt(quantityInput.value);
    if (quantity < 99) {
        quantityInput.value = quantity + 1;
        document.getElementById("quantity").value = quantityInput.value;
          document.getElementById("quantity1").value = quantityInput.value;
    }
}

function decrement() {
    var quantityInput = document.getElementById("quantityInput");
    var quantity = parseInt(quantityInput.value);
    if (quantity > 1) {
        quantityInput.value = quantity - 1;
        document.getElementById("quantity").value = quantityInput.value;
         document.getElementById("quantity1").value = quantityInput.value;
    }
} 


    