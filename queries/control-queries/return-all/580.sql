select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,date_dim d,item i
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 529 and ws.ws_hash <= 929 and d.d_hash >= 180 and d.d_hash <= 930 and i.i_hash >= 633 and i.i_hash <= 966
;
