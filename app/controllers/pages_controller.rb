class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # Se o usuario esta logo, redirecionar para cardápio
    redirect_to cardapio_path if user_signed_in?

    # Definicoes dos horarios de funcionamento
    @open_hours = []
    # Dias da semana vao de 0 ate 6, sendo que 0 é doming
    # Para o horario de fechamento: 24h significa meia noite do proximo dia, 26h significa ate
    # 2 horas da manha do dia seguinte, etc
    # Segunda feira: 08h as 22h
    @open_hours[1] = [8,22]
    # Terca feira: 08h as 22h
    @open_hours[2] = [8,22]
    # Quarta feira: 08h as 00h
    @open_hours[3] = [8,24]
    # Quinta feira: 08h as 00h
    @open_hours[4] = [8,24]
    # Sexta feira: 08h as 02h
    @open_hours[5] = [8,26]
    # Sabado: 08h as 02h
    @open_hours[6] = [8,26]
    # Domingo: 08h as 24h
    @open_hours[0] = [8,24]

    @weekday_name = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thrusday', 'Friday', 'Saturday']

    datetime = Time.now

    @hora_now =  datetime.hour
    @minutos_now = datetime.strftime("%M").to_i
    @weekday_now = datetime.wday
    # Mudar dia da semana para ontem caso de horarios depois de meia-noite
    @weekday_now = datetime.wday - 1 if @hora_now >= 0 && @hora_now < 4
    @weekday_now += 7 if @weekday_now < 0

    # Status é aberto quando atende as condições, fechado nas outras
    # A condição é checar se o horario de agora está entre os dois horários indicados para aquele dia
    @status = 'Closed'
    if @hora_now > @open_hours[@weekday_now][0] && @hora_now < @open_hours[@weekday_now][1]
      @status = 'Open'
    end

  end
end


