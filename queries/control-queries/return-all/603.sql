select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,warehouse w,item i
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 10 and ws.ws_hash <= 760 and cd.cd_hash >= 138 and cd.cd_hash <= 471 and i.i_hash >= 353 and i.i_hash <= 753
;
