-- =====================================================================
-- Índices opcionales para la tabla ticket_asignaciones
-- Proyecto: dashboard-evidencias (GranMarquesCheck)
-- =====================================================================
-- Esta migración NO crea ni modifica la tabla ticket_asignaciones (que
-- ya existe y contiene datos). Solo añade índices opcionales para
-- acelerar las consultas que hace el dashboard.
--
-- Ejecutar en: Supabase → SQL Editor
-- Es seguro ejecutarlo varias veces (usa IF NOT EXISTS).
-- =====================================================================

-- Búsqueda por vendedor (para el ranking de vendedores con asignaciones)
create index if not exists ticket_asignaciones_vendedor_idx
    on public.ticket_asignaciones (vendedor_asignado);

-- Búsqueda por estado (para las sugerencias por estado)
create index if not exists ticket_asignaciones_estado_idx
    on public.ticket_asignaciones (estado_comercio);

-- Búsqueda por comercio_key (lookup rápido desde el dashboard)
create index if not exists ticket_asignaciones_comercio_key_idx
    on public.ticket_asignaciones (comercio_key);

-- =====================================================================
-- Row Level Security (opcional)
-- =====================================================================
-- El dashboard usa la anon key pública. Si quieres restringir quién puede
-- leer/escribir asignaciones, descomenta y adapta las políticas siguientes.
-- Por defecto se asume que el acceso es público (mismo nivel que el resto
-- del dashboard). Cambiar a "to authenticated" si se desea mayor control.
-- =====================================================================

-- alter table public.ticket_asignaciones enable row level security;
--
-- drop policy if exists "Lectura pública de asignaciones"
--     on public.ticket_asignaciones;
-- create policy "Lectura pública de asignaciones"
--     on public.ticket_asignaciones for select using (true);
--
-- drop policy if exists "Escritura pública de asignaciones"
--     on public.ticket_asignaciones;
-- create policy "Escritura pública de asignaciones"
--     on public.ticket_asignaciones for all using (true) with check (true);
