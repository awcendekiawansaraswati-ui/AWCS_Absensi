-- AWCS FIX RLS ABSEN WITA
ALTER TABLE public.attendance ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS attendance_guru_insert_wita_fix ON public.attendance;
DROP POLICY IF EXISTS attendance_guru_update_wita_fix ON public.attendance;
CREATE POLICY attendance_guru_insert_wita_fix ON public.attendance AS PERMISSIVE FOR INSERT TO authenticated WITH CHECK (teacher_id = private.my_teacher_id() AND attendance_date = ((now() AT TIME ZONE 'Asia/Makassar')::date));
CREATE POLICY attendance_guru_update_wita_fix ON public.attendance AS PERMISSIVE FOR UPDATE TO authenticated USING (teacher_id = private.my_teacher_id()) WITH CHECK (teacher_id = private.my_teacher_id() AND attendance_date = ((now() AT TIME ZONE 'Asia/Makassar')::date));
