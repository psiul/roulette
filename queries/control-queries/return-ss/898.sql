select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer_demographics cd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and i.i_hash >= 476 and i.i_hash <= 876 and cd.cd_hash >= 97 and cd.cd_hash <= 430 and d.d_hash >= 133 and d.d_hash <= 883
;
