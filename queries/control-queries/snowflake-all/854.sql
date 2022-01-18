select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,household_demographics hd,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 110 and ws.ws_hash <= 860 and d.d_hash >= 586 and d.d_hash <= 986 and i.i_hash >= 184 and i.i_hash <= 517
;
