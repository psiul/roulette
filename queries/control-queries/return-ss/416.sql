select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 34 and ss.ss_hash <= 434 and cd.cd_hash >= 206 and cd.cd_hash <= 956 and hd.hd_hash >= 538 and hd.hd_hash <= 871
;
