select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 116 and cd.cd_hash <= 449 and i.i_hash >= 87 and i.i_hash <= 837 and d.d_hash >= 263 and d.d_hash <= 663
;
