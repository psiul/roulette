select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,item i,ship_mode sm
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 289 and ws.ws_hash <= 622 and hd.hd_hash >= 89 and hd.hd_hash <= 839 and sm.sm_hash >= 19 and sm.sm_hash <= 419
;
