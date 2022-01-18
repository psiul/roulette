select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,item i,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 474 and d.d_hash <= 874 and i.i_hash >= 169 and i.i_hash <= 502 and hd.hd_hash >= 196 and hd.hd_hash <= 946
;
