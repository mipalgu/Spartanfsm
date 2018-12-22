h_sync <= h_sync_temp;
v_sync <= v_sync_temp;
if h_count >= h_rez  or v_count >= v_rez then
	red <= "00000000";
	green <= "00000000";
	blue <= "00000000";
	blank <= '1';
else
	red <= redPixels(h_count, v_count);
	green <= greenPixels(h_count, v_count);
	blue <= bluePixels(h_count, v_count);
	blank <= '0';
end if;
