load("Ruta Al Archivo train.RData")


# Correlacion entre variables numericas a 2 componentes

biplot(princomp(train[,c(6:9,12)],1))

# Filtro de nivel de temperatura, va del 1 al 5 


temperatura<-
  2

# Día de la semana 0 es Domingo 6 es Sábado

dia_semana<-
  6

filtro<-
  train$temp_cut==temperatura & train$weekday==dia_semana


# Usuarios totales

plot(x=1:sum(filtro),y=exp(train$count[filtro]),type="l",xlab="Día/Hora",ylab="Usuarios",main="Usuarios Totales")
lines(1:sum(filtro),y=train$predict_sin_log[filtro],col="red")

# Usuarios registrados

plot(x=1:sum(filtro),y=exp(train$registered[filtro]),type="l",xlab="Día/Hora",ylab="Usuarios",main="Usuarios Registrados")
lines(1:sum(filtro),y=train$predict_registered_sin_log[filtro],col="red")

# Usuarios casuales

plot(x=1:sum(filtro),y=exp(train$casual[filtro]),type="l",xlab="Día/Hora",ylab="Usuarios",main="Usuarios Casuales")
lines(1:sum(filtro),y=train$predict_casual_sin_log[filtro],col="red")

