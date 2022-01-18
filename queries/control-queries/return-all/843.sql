select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 118 and ss.ss_hash <= 868 and cd.cd_hash >= 492 and cd.cd_hash <= 825 and i.i_hash >= 80 and i.i_hash <= 480
;
