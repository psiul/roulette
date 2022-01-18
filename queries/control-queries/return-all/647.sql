select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 432 and ss.ss_hash <= 832 and i.i_hash >= 178 and i.i_hash <= 928 and cd.cd_hash >= 435 and cd.cd_hash <= 768
;
