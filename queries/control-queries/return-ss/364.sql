select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and i.i_hash >= 7 and i.i_hash <= 407 and cd.cd_hash >= 200 and cd.cd_hash <= 950 and d.d_hash >= 449 and d.d_hash <= 782
;
