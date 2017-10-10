task movimientos: :environment do

  clientes = Cliente.all.to_a

  Cliente.find_each do |cliente|
    5.times do
      movimiento = cliente.movimientos_como_emisor.create! hora: Time.now,
        tipo: ['ingreso', 'egreso'].sample,
        esta_confirmado: true,
        motivo: ['Cambio de cliente', 'Derogación de autoridad', nil, nil, nil].sample,
        tipo_operacion: ['ingreso_de_valores', 'egreso_de_valores', 'pago_de_fichas', 'venta_de_fichas'].sample,
        observaciones: ['Esta vez te la dejo pasar', nil, nil, nil, nil, nil, nil, nil].sample,
        receptor: clientes.sample
      puts movimiento.hora
    end
  end

end
