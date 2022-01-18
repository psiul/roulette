select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,warehouse w,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 118 and ws.ws_hash <= 868 and cd.cd_hash >= 566 and cd.cd_hash <= 966 and i.i_hash >= 523 and i.i_hash <= 856
;
