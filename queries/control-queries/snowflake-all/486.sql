select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,warehouse w,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 222 and ws.ws_hash <= 622 and d.d_hash >= 666 and d.d_hash <= 999 and sm.sm_hash >= 171 and sm.sm_hash <= 921
;
