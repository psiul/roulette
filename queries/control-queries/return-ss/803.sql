select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,store_returns sr,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 342 and ss.ss_hash <= 675 and cd.cd_hash >= 74 and cd.cd_hash <= 824 and i.i_hash >= 92 and i.i_hash <= 492
;
