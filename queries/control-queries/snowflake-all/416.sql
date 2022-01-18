select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,household_demographics hd,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and i.i_hash >= 129 and i.i_hash <= 529 and hd.hd_hash >= 122 and hd.hd_hash <= 455 and d.d_hash >= 99 and d.d_hash <= 849
;
