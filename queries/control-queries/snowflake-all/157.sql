select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,household_demographics hd,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 214 and ws.ws_hash <= 964 and sm.sm_hash >= 415 and sm.sm_hash <= 748 and hd.hd_hash >= 401 and hd.hd_hash <= 801
;
