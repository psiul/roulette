select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,store_returns sr,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 211 and ss.ss_hash <= 961 and hd.hd_hash >= 329 and hd.hd_hash <= 729 and cd.cd_hash >= 280 and cd.cd_hash <= 613
;
