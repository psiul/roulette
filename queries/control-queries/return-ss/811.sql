select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,store_returns sr,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 245 and hd.hd_hash <= 995 and d.d_hash >= 226 and d.d_hash <= 559 and cd.cd_hash >= 43 and cd.cd_hash <= 443
;
