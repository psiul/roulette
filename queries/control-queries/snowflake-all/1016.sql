select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,item i,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 7 and d.d_hash <= 757 and cd.cd_hash >= 504 and cd.cd_hash <= 837 and i.i_hash >= 255 and i.i_hash <= 655
;
