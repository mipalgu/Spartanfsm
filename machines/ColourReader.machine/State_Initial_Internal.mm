if (read = '1') then
	redOut <= redIn;
	greenOut <= greenIn;
	blueOut <= blueIn;
	hSyncOut <= hSyncIn;
	vSyncOut <= vSyncIn;
	if (redIn = "11111111") then
		blankRed <= '0';
		blankGreen <= '1';
		blankBlue <= '1';
	elsif (greenIn = "11111111") then
		blankGreen <= '0';
		blankRed <= '1';
		blankBlue <= '1';
        else
		blankBlue <= '0';
		blankRed <= '1';
		blankGreen <= '1';
	end if;
end if;
