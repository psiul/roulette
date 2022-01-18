select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,date_dim d,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 216 and ss.ss_hash <= 616 and cd.cd_hash >= 131 and cd.cd_hash <= 881 and i.i_hash >= 393 and i.i_hash <= 726
;
