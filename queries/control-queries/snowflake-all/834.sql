select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,date_dim d,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 524 and ws.ws_hash <= 857 and cd.cd_hash >= 219 and cd.cd_hash <= 619 and i.i_hash >= 77 and i.i_hash <= 827
;
