select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 228 and ss.ss_hash <= 978 and d.d_hash >= 137 and d.d_hash <= 470 and cd.cd_hash >= 205 and cd.cd_hash <= 605
;
