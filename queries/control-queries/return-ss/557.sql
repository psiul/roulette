select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 285 and ss.ss_hash <= 618 and cd.cd_hash >= 217 and cd.cd_hash <= 617 and d.d_hash >= 172 and d.d_hash <= 922
;
