select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,web_returns wr,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 186 and ws.ws_hash <= 936 and cd.cd_hash >= 175 and cd.cd_hash <= 508 and i.i_hash >= 364 and i.i_hash <= 764
;
