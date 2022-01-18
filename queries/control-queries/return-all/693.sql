select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,ship_mode sm,web_returns wr
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 164 and ws.ws_hash <= 914 and i.i_hash >= 501 and i.i_hash <= 901 and hd.hd_hash >= 457 and hd.hd_hash <= 790
;
