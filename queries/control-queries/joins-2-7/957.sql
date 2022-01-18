select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 365 and ss.ss_hash <= 865 and i.i_hash >= 183 and i.i_hash <= 383
;
