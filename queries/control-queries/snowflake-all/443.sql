select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,household_demographics hd,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 146 and d.d_hash <= 896 and i.i_hash >= 528 and i.i_hash <= 861 and hd.hd_hash >= 93 and hd.hd_hash <= 493
;
