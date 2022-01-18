select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,item i,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and hd.hd_hash >= 121 and hd.hd_hash <= 454 and d.d_hash >= 494 and d.d_hash <= 894 and i.i_hash >= 183 and i.i_hash <= 933
;
