select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,store_returns sr,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 193 and ss.ss_hash <= 943 and d.d_hash >= 539 and d.d_hash <= 939 and cd.cd_hash >= 277 and cd.cd_hash <= 610
;
