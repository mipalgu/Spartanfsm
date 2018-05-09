if h_count >= h_sync_start and h_count < h_sync_end then
	h_sync_temp <= '1';	
else
	h_sync_temp <= '0';
end if;
if v_count >= v_sync_start and v_count < v_sync_end then
	v_sync_temp = '1';
else
	v_sync_temp = '0';
end if;
