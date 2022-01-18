select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,item i,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and hd.hd_hash >= 55 and hd.hd_hash <= 455 and d.d_hash >= 188 and d.d_hash <= 938 and i.i_hash >= 401 and i.i_hash <= 734
;
