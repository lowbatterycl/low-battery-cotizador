LOWBATTERY COTIZADOR — ARCHIVOS NUEVOS

Incluye:
- index.html: formulario público
- admin.html: panel privado
- logo.png: logo
- schema.sql: SQL de tablas/policies Supabase

CONFIGURACIÓN ACTUAL:
El código usa la URL y publishable key del proyecto Supabase que ya configuraste.
El correo de administrador previsto es lyonsamuel11@gmail.com.

IMPORTANTE:
1) Ejecutar schema.sql en Supabase SQL Editor si las policies o tabla no existen (o revisar policies existentes antes de ejecutar para evitar duplicados).
2) En Supabase Authentication, crear el usuario administrador con el correo configurado y una contraseña. No se crea usuario automáticamente.
3) En GitHub, subir index.html, admin.html y logo.png a la raíz del repositorio y activar Pages.
4) La notificación por email a nuevas solicitudes no está activada todavía: necesita un servicio de correo y una función segura del lado servidor (no poner secretos en los HTML).
5) El dashboard sólo está diseñado para el email administrador indicado; el control de acceso real depende de las policies RLS de Supabase.
