select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 457 and ss.ss_hash <= 790 and d.d_hash >= 44 and d.d_hash <= 794 and cd.cd_hash >= 505 and cd.cd_hash <= 905
;
