select count(ws.ws_item_sk)
from web_sales ws,item i,date_dim d,warehouse w,household_demographics hd
where ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 565 and ws.ws_hash <= 965 and i.i_hash >= 137 and i.i_hash <= 887 and hd.hd_hash >= 533 and hd.hd_hash <= 866
;
