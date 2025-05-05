FROM squidfunk/mkdocs-material

RUN pip install --no-cache-dir mkdocs_puml pymdown-extensions mkdocs-markdownextradata-plugin mkdocs-glightbox

WORKDIR /docs

ENTRYPOINT ["/sbin/tini", "--", "mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]