select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 583 and hd.hd_hash <= 916 and cd.cd_hash >= 188 and cd.cd_hash <= 938 and i.i_hash >= 593 and i.i_hash <= 993
;
