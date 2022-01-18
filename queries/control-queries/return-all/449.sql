select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,household_demographics hd,item i,web_returns wr
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 12 and ws.ws_hash <= 762 and sm.sm_hash >= 432 and sm.sm_hash <= 832 and hd.hd_hash >= 249 and hd.hd_hash <= 582
;
