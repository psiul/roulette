select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,item i,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 72 and hd.hd_hash <= 405 and i.i_hash >= 118 and i.i_hash <= 868 and cd.cd_hash >= 441 and cd.cd_hash <= 841
;
